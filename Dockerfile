FROM lafyun/laf:latest AS laf
FROM labring/flannel:v0.19.0 AS flannel
FROM labring/openebs:v1.9.0 AS openebs
FROM labring/cert-manager:v1.8.0 AS cert-manager
FROM labring/metrics-server:v0.6.2 AS metrics-server
FROM docker.io/labring/ingress-nginx:v1.8.1 AS ingress-nginx
FROM labring/kubeblocks:v0.7.1 AS kubeblocks
FROM labring/kubernetes:v1.24.9 AS kubernetes

FROM ubuntu:20.04
# 从中间镜像复制 bash 到目标镜像
COPY --from=laf * /aidreamwin/laf/
COPY --from=flannel * /aidreamwin/flannel/
COPY --from=openebs * /aidreamwin/openebs/
COPY --from=cert-manager * /aidreamwin/cert-manager/
COPY --from=metrics-server * /aidreamwin/metrics-server/
COPY --from=ingress-nginx * /aidreamwin/ingress-nginx/
COPY --from=kubeblocks * /aidreamwin/kubeblocks/
COPY --from=kubernetes * /aidreamwin/kubernetes/

# 设置默认 shell 为 bash
CMD ["bash"]
