# 学校生活质量筛选框架

## 接入位置

学校生活质量不应该替代“能不能录取”和“专业是否合适”，而应该放在候选学校已经形成之后，用来做同档学校的排序和排雷。

推荐接入阶段：

1. 学生确定专业大方向。
2. 根据位次和招生计划形成冲稳保候选学校。
3. 对候选学校逐一查询生活质量信息。
4. 把明显不能接受的学校降权或剔除。
5. 在录取概率接近的学校之间，用生活质量做排序。

## CollegesChat/university-information 可用信息

该项目收集高校招生资料通常不会写、但影响大学生活质量的细节。适合作为 Skill 的学校生活质量资料源。

- 仓库地址：https://github.com/CollegesChat/university-information
- 推荐分支：`generated`
- 本 Skill 的同步脚本：`scripts/sync_university_information.sh`
- 同步后的本地路径：`external/university-information`
- 高校 Markdown 路径：`external/university-information/docs/universities/*.md`
- 数据性质：社区问卷数据，不是官方招生或学校政策文件。

可查询或整理的维度包括：

- 宿舍是否上床下桌。
- 宿舍、教室是否有空调。
- 是否独立卫浴，澡堂距离和热水时间。
- 是否早晚自习、晨跑、跑步打卡。
- 寒暑假、小学期安排。
- 外卖、快递、超市、食堂、校园卡。
- 地铁/交通、校区位置、共享单车。
- 校园网、断电断网、宿舍限电。
- 门禁、查寝、封寝、晚归。
- 是否允许大一带电脑。
- 通宵自习空间、电动车政策。

## 使用时的注意事项

- 使用前先读取 `references/university-life-data.md`，确认仓库、分支、许可证和同步方式。
- 如果本地没有 `external/university-information`，先运行 `scripts/sync_university_information.sh`。
- 社区资料可能过时，尤其宿舍、校区、断电、门禁和食堂情况会变化。
- 同一学校不同校区差异可能极大，必须确认专业所在校区。
- 生活质量只做排序辅助，不应因为“宿舍好”牺牲明显更合适的专业和录取安全。
- 对学生特别敏感的问题，例如断电、洗澡、空调、校区偏远，应在最终志愿表前二次核验。

## 建议输出格式

| 学校 | 专业/专业组 | 校区 | 录取层级 | 宿舍 | 空调 | 卫浴/洗浴 | 断电断网 | 交通 | 风险备注 | 排序建议 |
|---|---|---|---|---|---|---|---|---|---|---|

## 数据说明

- GitHub 项目：CollegesChat/university-information
- 仓库链接：https://github.com/CollegesChat/university-information
- 项目说明：收集全国高校招生时不会写明、但会影响生活质量的要求与细节。
- 使用建议：拉取 `generated` 分支的 Markdown 资料，做学校名检索和字段抽取。
