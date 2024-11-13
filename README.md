# k8s部署云开发Laf

手动安装云开发Laf

## 前提条件

已经正确安装k8s，并且机器能正常访问互联网

## 安装 helm

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

## openebs

```
cd openebs
kubectl apply -f openebs-operator.yaml
kubectl apply -f host-path-sc.yaml
```

## cert-manager

```
cd cert-manager
kubectl apply -f cert-manager.yaml

```

## metrics-server

```
cd metrics-server
helm install metrics-server ./metrics-server -n kube-system
```

## ingress-nginx

```
cd ingress-nginx
HELM_OPTS="--set controller.hostNetwork=true --set controller.kind=DaemonSet --set controller.service.enabled=false" ./entrypoint.sh
```

安装kubeblocks
```
cd kubeblocks
./kbcli kubeblocks install

```

## Laf

```
cd laf
export DOMAIN="127.0.0.1.nip.io"
bash start.sh
```

## 数据来源

本库提供的源文件来源与`Dockerfile`，使用下面命令即可构建导出

构建镜像
```
docker build -t test:all .
```

导出文件
```
docker run --name=laf --rm -v $PWD/data:/data -it  test:all /bin/bash
# cp -r /aidreamwin/ /data
```