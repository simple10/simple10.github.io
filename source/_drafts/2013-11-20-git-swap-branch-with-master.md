Useful git hack to swap master with a better branch.

```bash
git checko
git checkout better_branch
git merge --strategy=ours master    # keep the content of this branch, but record a merge
git checkout master
git merge better_branch             # fast-forward master up to the merge
```

[Thanks to StackOverflow](http://stackoverflow.com/questions/2763006/change-the-current-branch-to-master-in-git)
