.class public Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "ConfigService.java"


# instance fields
.field mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 24
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    .line 25
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 1

    .prologue
    .line 123
    return-void
.end method

.method public getBoolean(I)Z
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public getColor(I)I
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public getDimensionPixelSize(I)I
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public getFraction(III)F
    .registers 5
    .param p1, "res"    # I
    .param p2, "base"    # I
    .param p3, "pbase"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    return v0
.end method

.method public getIntArray(I)[I
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    return-object v0
.end method

.method public getInteger(I)I
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0
.end method

.method public getSizeArray(I)[I
    .registers 6
    .param p1, "res"    # I

    .prologue
    .line 56
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v0, v3, Landroid/util/DisplayMetrics;->density:F

    .line 57
    .local v0, "density":F
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getIntArray(I)[I

    move-result-object v2

    .line 58
    .local v2, "values":[I
    if-eqz v2, :cond_1c

    .line 59
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    array-length v3, v2

    if-ge v1, v3, :cond_1c

    .line 60
    aget v3, v2, v1

    int-to-float v3, v3

    mul-float/2addr v3, v0

    float-to-int v3, v3

    aput v3, v2, v1

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 63
    .end local v1    # "i":I
    :cond_1c
    return-object v2
.end method

.method public getString(I)Ljava/lang/String;
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStringArray(I)[Ljava/lang/String;
    .registers 3
    .param p1, "res"    # I

    .prologue
    .line 116
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
