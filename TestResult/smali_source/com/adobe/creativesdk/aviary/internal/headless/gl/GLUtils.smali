.class public final Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;
.super Ljava/lang/Object;
.source "GLUtils.java"


# static fields
.field private static mGlEsVersion:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;->mGlEsVersion:I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getGlEsEnabled(Landroid/content/Context;)Z
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;->n_getOpenGLEnabled()Z

    move-result v0

    return v0
.end method

.method public static getGlEsVersion(Landroid/content/Context;)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    sget v2, Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;->mGlEsVersion:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_15

    .line 21
    const-string v2, "activity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 22
    .local v0, "activityManager":Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v1

    .line 23
    .local v1, "configuration":Landroid/content/pm/ConfigurationInfo;
    iget v2, v1, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    sput v2, Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;->mGlEsVersion:I

    .line 25
    .end local v0    # "activityManager":Landroid/app/ActivityManager;
    .end local v1    # "configuration":Landroid/content/pm/ConfigurationInfo;
    :cond_15
    sget v2, Lcom/adobe/creativesdk/aviary/internal/headless/gl/GLUtils;->mGlEsVersion:I

    return v2
.end method

.method public static native n_getOpenGLEnabled()Z
.end method
