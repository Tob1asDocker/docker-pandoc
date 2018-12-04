# pandoc
Image with pandoc for gitlab-ci

For the GitLab of the federal state Rhineland-Palatinate in Germany.

```
image: tobi312/pandoc:latest

build:
  script:
    # Runs pandoc on all .md files in the repo and outputs them as PDF and DOCX
    - find . -name '*.md' -exec sh -c 'pandoc $0 -f markdown -t docx -o $0.docx' {} \;
    - find . -name '*.md' -exec sh -c 'pandoc $0 -f markdown -t latex --latex-engine=xelatex --toc -V lang=ngerman -V papersize=a4paper -V geometry:portrait -V documentclass=article -o $0.pdf' {} \;
  artifacts:
    # Attach all untracked files (e.g. files that were recently created and not yet committed to git) as artifacts.
    # These are the files you then download after the job has finished.
    untracked: true
  only:
    # Only run when tag
    - tags

```
