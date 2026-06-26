# External Data

This folder is reserved for synced public university-life datasets.

Run from the skill root:

```bash
scripts/sync_university_information.sh
```

The script clones `https://github.com/CollegesChat/university-information.git` branch `generated` into `external/university-information`. That checkout is ignored by Git because it is a large, separately maintained dataset.
