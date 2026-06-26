# Gaokao Major Volunteer Skill

高考志愿填报与大学专业选择 Codex Skill，用于帮助高考生从分数、位次、专业兴趣、选科限制、升学路径、就业风险和大学生活质量等维度，系统完成专业与院校选择。

## What This Skill Does

- 梳理查分后从定位、选专业、定院校到排志愿表的完整流程。
- 将分散的专业选择、升学路径和校园体验信息整理为可复用的 Markdown 参考库。
- 区分志愿填报、本科升学、大学生存、官方专业解读、专业科普等知识模块。
- 接入 `CollegesChat/university-information`，用于比较学校断电、宿舍、校区、生活条件等大学体验信息。
- 强制提示用户交叉验证招生章程、省考试院数据、专业选科要求和最新录取位次。

## Project Structure

```text
.
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── volunteer-filling.md
│   ├── major-selection.md
│   ├── undergraduate-paths.md
│   ├── college-survival.md
│   ├── official-major-verification.md
│   └── ...
├── external/
│   └── README.md
└── scripts/
    └── sync_university_information.sh
```

## External University Data

This project does not commit the full `university-information` dataset. To sync it locally:

```bash
scripts/sync_university_information.sh
```

By default, the script clones:

```text
https://github.com/CollegesChat/university-information.git
```

branch:

```text
generated
```

into:

```text
external/university-information
```

The synced dataset is ignored by Git because it is a large, separately maintained public dataset and should remain licensed and refreshable outside this repository.
