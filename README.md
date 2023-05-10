Codes associated with FEM-BEM coupling project.

You can easily run codes in this repository using the [mscroggs/fem-bem-lab](https://hub.docker.com/r/mscroggs/fem-bem-lab) Docker image.
You can download and run this image with:

```bash
docker pull mscroggs/fem-bem-lab:latest
docker run -p 8888:8888 mscroggs/fem-bem-lab
```

After executing the second line, a URL will be displayed. This URL will lead to a Jupyter lab
in which you can access and run all the examples in this repository.

If you want to share a folder on your computer with the Jupyter lab, you can run the following line
to share the folder `/path/to/folder' on your computer:

```bash
docker run -p 8888:8888 -v /path/to/folder:/root/shared mscroggs/fem-bem-lab
```
