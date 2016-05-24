.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;
.super Ljava/lang/Object;
.source "ScreenUtils.java"


# static fields
.field private static mIsTablet:Z

.field private static mIsTabletChecked:Z


# direct methods
.method public static isTablet(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->mIsTabletChecked:Z

    if-nez v0, :cond_13

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_is_tablet:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->mIsTablet:Z

    .line 52
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->mIsTabletChecked:Z

    .line 54
    :cond_13
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->mIsTablet:Z

    return v0
.end method
