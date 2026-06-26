# External University Life Data

## CollegesChat/university-information

- Repository: https://github.com/CollegesChat/university-information
- Git URL: https://github.com/CollegesChat/university-information.git
- Preferred branch: `generated`
- Verified generated branch commit on 2026-06-26: `079a5070420e14f8db42275d66f33eefab569042`
- Local sync path: `external/university-information`
- Local sync metadata: `external/university-information.sync-info`
- Main generated data path: `docs/universities/*.md`
- General guide path: `docs/choose-a-college/影响生活质量的一些方面.md`
- License observed in repository: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International.

Use this dataset only for school life-quality clues after the student already has a candidate school list. It is community questionnaire data, not official admissions data.

## Sync Command

From the skill root:

```bash
scripts/sync_university_information.sh
```

The script clones or updates the `generated` branch into `external/university-information`. The synced directory is intentionally ignored by Git to avoid vendoring a large third-party dataset into this skill repository.

## Retrieval Workflow

1. Sync the repository with `scripts/sync_university_information.sh`.
2. Search by exact school name in `external/university-information/README.md`.
3. Open the linked Markdown file under `external/university-information/docs/universities/`.
4. Extract only the fields relevant to final志愿排序:宿舍、空调、独卫/洗浴、断电断网、限电、门禁查寝、外卖快递、食堂、交通、校区位置.
5. Mark contradictions, old entries, and campus-specific differences as "需二次确认".

## Data Caveats

- The data is questionnaire-based and may contain conflicting answers from different respondents.
- Schools and campuses change policies; treat time-sensitive items such as宿舍、空调、断电、门禁、食堂、校区 as clues, not final facts.
- Same-school different-campus entries may differ sharply. Always match the student's target major to its actual campus before using living-condition data.
- Do not use this dataset to estimate admission probability, major strength,就业率,保研率, or official policy.
- Do not surface respondent emails or other contact details in student-facing outputs. Summarize the living-condition signal and cite the project/repository instead.
