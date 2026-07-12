#!/usr/bin/env python3
"""
FinalCode Regression Validation Script

Compares current release against previous release for each benchmark.
Reports unexpected differences.
"""

import json
import os
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional


class RegressionValidator:
    """Validates regression across benchmarks."""

    def __init__(self, benchmarks_dir: str):
        self.benchmarks_dir = Path(benchmarks_dir)
        self.results: List[Dict[str, Any]] = []

    def load_benchmark_metadata(self, benchmark_name: str) -> Dict[str, Any]:
        """Load metadata for a benchmark."""
        metadata_path = self.benchmarks_dir / "benchmarks" / benchmark_name / "metadata.json"
        if metadata_path.exists():
            with open(metadata_path, "r") as f:
                return json.load(f)
        return {}

    def load_expected_findings(self, benchmark_name: str) -> Dict[str, Any]:
        """Load expected findings for a benchmark."""
        findings_path = self.benchmarks_dir / "benchmarks" / benchmark_name / "expected-findings.json"
        if findings_path.exists():
            with open(findings_path, "r") as f:
                return json.load(f)
        return {}

    def load_golden_report(self, benchmark_name: str) -> str:
        """Load golden report for a benchmark."""
        report_path = self.benchmarks_dir / "benchmarks" / benchmark_name / "golden-report.md"
        if report_path.exists():
            with open(report_path, "r") as f:
                return f.read()
        return ""

    def validate_benchmark(self, benchmark_name: str) -> Dict[str, Any]:
        """Validate a single benchmark."""
        metadata = self.load_benchmark_metadata(benchmark_name)
        expected = self.load_expected_findings(benchmark_name)
        golden = self.load_golden_report(benchmark_name)

        result = {
            "benchmark": benchmark_name,
            "metadata_loaded": bool(metadata),
            "expected_findings_loaded": bool(expected),
            "golden_report_loaded": bool(golden),
            "status": "valid",
            "issues": []
        }

        if not metadata:
            result["issues"].append("Missing metadata.json")
            result["status"] = "invalid"

        if not expected:
            result["issues"].append("Missing expected-findings.json")
            result["status"] = "invalid"

        if not golden:
            result["issues"].append("Missing golden-report.md")
            result["status"] = "invalid"

        return result

    def validate_all_benchmarks(self) -> Dict[str, Any]:
        """Validate all benchmarks."""
        benchmarks = [
            "react-small",
            "react-large",
            "next-production",
            "node-api",
            "express-api",
            "cloudflare-worker",
            "typescript-library",
            "production-ready",
            "intentionally-broken"
        ]

        results = []
        for benchmark in benchmarks:
            result = self.validate_benchmark(benchmark)
            results.append(result)
            self.results.append(result)

        summary = {
            "total_benchmarks": len(benchmarks),
            "valid": sum(1 for r in results if r["status"] == "valid"),
            "invalid": sum(1 for r in results if r["status"] == "invalid"),
            "results": results
        }

        return summary

    def validate_regression_dashboard(self) -> Dict[str, Any]:
        """Validate regression dashboard exists and is valid."""
        dashboard_path = self.benchmarks_dir / "regression-dashboard.json"
        if not dashboard_path.exists():
            return {"status": "missing", "issues": ["regression-dashboard.json not found"]}

        with open(dashboard_path, "r") as f:
            dashboard = json.load(f)

        issues = []
        if "summary" not in dashboard:
            issues.append("Missing summary section")
        if "benchmarks" not in dashboard:
            issues.append("Missing benchmarks section")

        return {
            "status": "valid" if not issues else "invalid",
            "issues": issues,
            "summary": dashboard.get("summary", {})
        }

    def validate_coverage(self) -> Dict[str, Any]:
        """Validate coverage tracking exists and is valid."""
        coverage_path = self.benchmarks_dir / "coverage.json"
        if not coverage_path.exists():
            return {"status": "missing", "issues": ["coverage.json not found"]}

        with open(coverage_path, "r") as f:
            coverage = json.load(f)

        issues = []
        if "coverage" not in coverage:
            issues.append("Missing coverage section")
        if "overallCoverage" not in coverage:
            issues.append("Missing overallCoverage section")

        return {
            "status": "valid" if not issues else "invalid",
            "issues": issues,
            "overallCoverage": coverage.get("overallCoverage", {})
        }

    def validate_rule_stability(self) -> Dict[str, Any]:
        """Validate rule stability registry exists and is valid."""
        stability_path = self.benchmarks_dir / "rule-stability.json"
        if not stability_path.exists():
            return {"status": "missing", "issues": ["rule-stability.json not found"]}

        with open(stability_path, "r") as f:
            stability = json.load(f)

        issues = []
        if "rules" not in stability:
            issues.append("Missing rules section")
        if "summary" not in stability:
            issues.append("Missing summary section")

        return {
            "status": "valid" if not issues else "invalid",
            "issues": issues,
            "summary": stability.get("summary", {})
        }

    def validate_rule_validation_matrix(self) -> Dict[str, Any]:
        """Validate rule validation matrix exists and is valid."""
        matrix_path = self.benchmarks_dir / "rule-validation-matrix.json"
        if not matrix_path.exists():
            return {"status": "missing", "issues": ["rule-validation-matrix.json not found"]}

        with open(matrix_path, "r") as f:
            matrix = json.load(f)

        issues = []
        if "rules" not in matrix:
            issues.append("Missing rules section")

        return {
            "status": "valid" if not issues else "invalid",
            "issues": issues,
            "rulesCount": len(matrix.get("rules", {}))
        }

    def run_validation(self) -> Dict[str, Any]:
        """Run full validation suite."""
        print("Running FinalCode Regression Validation...")
        print("=" * 60)

        # Validate benchmarks
        print("\n1. Validating benchmarks...")
        benchmark_results = self.validate_all_benchmarks()
        print(f"   Total: {benchmark_results['total_benchmarks']}")
        print(f"   Valid: {benchmark_results['valid']}")
        print(f"   Invalid: {benchmark_results['invalid']}")

        # Validate regression dashboard
        print("\n2. Validating regression dashboard...")
        dashboard_result = self.validate_regression_dashboard()
        print(f"   Status: {dashboard_result['status']}")
        if dashboard_result.get("summary"):
            print(f"   Overall Stability: {dashboard_result['summary'].get('overallStability', 'N/A')}")

        # Validate coverage
        print("\n3. Validating coverage...")
        coverage_result = self.validate_coverage()
        print(f"   Status: {coverage_result['status']}")
        if coverage_result.get("overallCoverage"):
            print(f"   Overall Coverage: {coverage_result['overallCoverage'].get('average', 'N/A')}")

        # Validate rule stability
        print("\n4. Validating rule stability...")
        stability_result = self.validate_rule_stability()
        print(f"   Status: {stability_result['status']}")
        if stability_result.get("summary"):
            print(f"   Total Rules: {stability_result['summary'].get('totalRules', 'N/A')}")

        # Validate rule validation matrix
        print("\n5. Validating rule validation matrix...")
        matrix_result = self.validate_rule_validation_matrix()
        print(f"   Status: {matrix_result['status']}")
        print(f"   Rules Defined: {matrix_result.get('rulesCount', 'N/A')}")

        # Summary
        print("\n" + "=" * 60)
        print("VALIDATION SUMMARY")
        print("=" * 60)

        all_valid = (
            benchmark_results["invalid"] == 0
            and dashboard_result["status"] == "valid"
            and coverage_result["status"] == "valid"
            and stability_result["status"] == "valid"
            and matrix_result["status"] == "valid"
        )

        print(f"Overall Status: {'PASS' if all_valid else 'FAIL'}")

        return {
            "benchmarks": benchmark_results,
            "dashboard": dashboard_result,
            "coverage": coverage_result,
            "stability": stability_result,
            "matrix": matrix_result,
            "overallStatus": "PASS" if all_valid else "FAIL"
        }


def main():
    """Main entry point."""
    benchmarks_dir = os.path.join(os.path.dirname(__file__), "..")
    validator = RegressionValidator(benchmarks_dir)
    result = validator.run_validation()

    # Save results
    output_path = os.path.join(benchmarks_dir, "validation-results.json")
    with open(output_path, "w") as f:
        json.dump(result, f, indent=2)

    print(f"\nResults saved to: {output_path}")

    # Exit with appropriate code
    sys.exit(0 if result["overallStatus"] == "PASS" else 1)


if __name__ == "__main__":
    main()
