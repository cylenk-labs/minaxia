# Contributing to Minaxia

Issues and pull requests are welcome: clarifications, critical reviews, examples, application experience and translations can all help improve the method.

- For a substantial method change, open an issue first. Explain the problem, your rationale and the effect on scenario ratings.
- Keep pull requests focused. Distinguish editorial changes from changes to scores, formulas, class boundaries or the Risk Matrix.
- Use British English. Keep assessor guidance in `index.qmd` and calibration material in `calibration.qmd`.
- Share only material you are authorised to publish. Do not include confidential assessment data or undisclosed product vulnerabilities in public issues or pull requests.

## Licensing and recognition

By submitting material for inclusion in the method or documentation, you agree to license your contribution under [CC BY 4.0](LICENSE) and confirm that you have the right to do so. You retain your copyright; no copyright assignment to Cylenk is required. Identify any third-party material and its licence.

Under CC BY 4.0, Cylenk SA may edit and incorporate accepted contributions into official Minaxia releases and publish them under its Minaxia trade mark, while complying with the licence's attribution requirements. Contributors retain copyright in their contributions. Contributing does not grant any rights to the Minaxia trade mark.

Repository history records changes and their authors. Substantive contributions, including reviews, examples and translations, will also be acknowledged on the About page using contributors' preferred public names. Tell us how you would like to be credited.

## Review

Cylenk SA maintains the official method and has final editorial authority over accepted changes and official releases. A submission does not guarantee acceptance. Changes to the method follow the existing [release policy](calibration.qmd#stability-and-release-policy).

## Local check

With [Quarto](https://quarto.org/) installed, run `quarto render` and inspect the affected pages. Check any changed calculations and links, and run `git diff --check` before submitting. Rendering checks presentation, not method validity.

Only `index.qmd`, `calibration.qmd` and `about.qmd` are website render targets. This guide and the README are repository-only documents.
