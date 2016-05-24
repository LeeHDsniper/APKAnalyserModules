.class public Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;
.source "CdsServiceParamsUtils.java"


# direct methods
.method protected constructor <init>()V
    .registers 3

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;-><init>()V

    .line 11
    const-string v0, "CdsServiceParamsUtils"

    const-string v1, "default"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    return-void
.end method
