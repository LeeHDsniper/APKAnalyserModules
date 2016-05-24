.class final Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils$ApiKeyReader;
.super Ljava/lang/Object;
.source "SDKUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ApiKeyReader"
.end annotation


# static fields
.field private static final METADATA_CDS:Ljava/lang/String; = "com.aviary.android.feather.v1.CDS_RELEASE"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMetadataValue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 58
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 60
    .local v1, "metadata":Landroid/os/Bundle;
    if-nez v1, :cond_9

    .line 66
    .end local p2    # "defaultValue":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object p2

    .line 63
    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_9
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 64
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_8
.end method

.method static isCdsReleaseFromMetadata(Landroid/content/Context;Z)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # Z

    .prologue
    .line 70
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 71
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 73
    .local v1, "metadata":Landroid/os/Bundle;
    if-eqz v1, :cond_e

    .line 74
    const-string v2, "com.aviary.android.feather.v1.CDS_RELEASE"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 76
    .end local p1    # "defaultValue":Z
    :cond_e
    return p1
.end method
