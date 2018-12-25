# pandoc on x86_64  

### Supported tags and respective `Dockerfile` links
-	[`latest` (*Dockerfile*)](https://github.com/Tob1asDocker/docker-pandoc/blob/master/Dockerfile)
-	[`stable` (*Dockerfile*)](https://github.com/Tob1asDocker/docker-pandoc/blob/master/Dockerfile-stable)

### Information:  

Image for GitLab (gitlab-ci) of Rhineland-Palatinate in Germany.  

This image contains the following applications:  
* [TeX Live](https://www.tug.org/texlive/)  
* [Pandoc](https://pandoc.org/)  

### How to use this image (examples)

File ```.gitlab-ci.yml``` :  

```yml
image: tobi312/pandoc:latest

build:
  script:
    # Runs pandoc on all .md files in the repo and outputs them as PDF and DOCX
    - find . -name '*.md' -exec sh -c 'pandoc $0 -f markdown -t docx -o $0.docx' {} \;
    - find . -name '*.md' -exec sh -c 'pandoc $0 -f markdown -t latex --pdf-engine=xelatex --toc -V lang=de-DE -V papersize=a4paper -V geometry:portrait -V documentclass=article -o $0.pdf' {} \;
  artifacts:
    # Attach all untracked files (e.g. files that were recently created and not yet committed to git) as artifacts.
    # These are the files you then download after the job has finished.
    untracked: true
  only:
    # Only run when tag
    - tags

```

or  

```yml
image: tobi312/pandoc:stable

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

### This Image on  
* [DockerHub](https://hub.docker.com/r/tobi312/pandoc/)
* [GitHub](https://github.com/Tob1asDocker/docker-pandoc)
