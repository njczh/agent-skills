# Agent Skills

可复用的个人 Agent Skill 集合，采用 [MIT 许可证](LICENSE)。当前仍是本地候选草稿，尚未发布到 GitHub。

## 首批候选

| Skill | 用途 | 使用条件 |
|---|---|---|
| [expression-coach](skills/expression-coach/SKILL.md) | 理解、评价和训练中文 Prompt 表达 | 使用当前对话材料；侧边聊天为可选能力 |
| [scoop-manifest-creator](skills/scoop-manifest-creator/SKILL.md) | 调研软件并编写 Scoop manifest | Windows/Scoop 任务；能读取官方资料和目标 bucket；安装验证需 Scoop/PowerShell |
| [scoop-bucket-commit-message](skills/scoop-bucket-commit-message/SKILL.md) | 按目标 Scoop bucket 规则拟定提交信息或 PR 标题 | 实际变更及版本信息；仅拟稿不要求 Git 写权限 |

`agents/openai.yaml` 是 Codex 的可选界面元数据，其他 Agent 可以读取 `SKILL.md`；本轮没有验证跨 Agent 兼容性。

## 当前使用方式

本地审阅从上表的 `SKILL.md` 开始。需要试用时，将选定的整个 Skill 目录（含 `LICENSE`）安装到目标 Agent 支持的技能目录；尊重已有同名安装，不直接覆盖。仓库尚无远端，因此暂不提供可执行的 GitHub 安装命令。

本轮准备独立目录，不增加插件分发配置。许可证已补齐；插件分发仍需按目标客户端实际支持的格式打包并验证。

## 维护与发布

现有安装副本保持原样。公开版建立基线并完成试用之前，不自动同步回原位置。

## 许可证

除另有明确声明的第三方内容外，本仓库的 Skill 指令、随附参考材料及界面元数据采用 [MIT 许可证](LICENSE)。每个独立 Skill 目录也包含相同的完整 `LICENSE`，其 `SKILL.md` 标注 `license: MIT`。

MIT 允许使用、修改、商用和再分发；复制或分发全部或实质性部分时，应保留版权与许可声明。按许可证原文提供免责和无担保条款，不另加禁止商用等限制。

通过链接引用的第三方资料、目标应用及工具仍适用各自的许可；本仓库的 MIT 声明不替这些内容重新授权。公开发布前仍需确认所纳入材料的分发权利。
