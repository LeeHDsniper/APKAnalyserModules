.class public final Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;
.super Ljava/lang/Object;
.source "BundleUtils.java"


# direct methods
.method public static toString(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p0, :cond_9

    .line 35
    :cond_9
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
