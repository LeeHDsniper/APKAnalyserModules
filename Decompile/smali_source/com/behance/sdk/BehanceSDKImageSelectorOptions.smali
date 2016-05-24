.class public Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
.super Ljava/lang/Object;
.source "BehanceSDKImageSelectorOptions.java"


# static fields
.field public static UNLIMITED_NUM_OF_IMAGES:I


# instance fields
.field private allowedFileExtensions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private imageValidatorType:Ljava/lang/String;

.field private maxImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

.field private maxImageSizeInBytes:J

.field private maxNumberOfImages:I

.field private minImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

.field private minImageSizeInBytes:J

.field private prohibitedFileExtensions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private showImageSelectionSources:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const/4 v0, -0x1

    sput v0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const-wide/16 v2, -0x1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->showImageSelectionSources:Z

    .line 36
    iput-wide v2, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->minImageSizeInBytes:J

    .line 37
    iput-wide v2, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxImageSizeInBytes:J

    return-void
.end method

.method public static getSingleImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-static {v0, v0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getSingleImageSelectionOptions(Lcom/behance/sdk/BehanceSDKImageDimensions;Lcom/behance/sdk/BehanceSDKImageDimensions;)Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v0

    return-object v0
.end method

.method public static getSingleImageSelectionOptions(Lcom/behance/sdk/BehanceSDKImageDimensions;Lcom/behance/sdk/BehanceSDKImageDimensions;)Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    .registers 4
    .param p0, "minImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;
    .param p1, "maxImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;

    .prologue
    .line 56
    new-instance v0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    invoke-direct {v0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;-><init>()V

    .line 57
    .local v0, "options":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxNumberOfImages(I)V

    .line 58
    invoke-virtual {v0, p0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMinImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V

    .line 59
    invoke-virtual {v0, p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V

    .line 60
    return-object v0
.end method

.method public static getUnlimitedImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 64
    invoke-static {v0, v0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getUnlimitedImageSelectionOptions(Lcom/behance/sdk/BehanceSDKImageDimensions;Lcom/behance/sdk/BehanceSDKImageDimensions;)Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v0

    return-object v0
.end method

.method public static getUnlimitedImageSelectionOptions(Lcom/behance/sdk/BehanceSDKImageDimensions;Lcom/behance/sdk/BehanceSDKImageDimensions;)Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    .registers 4
    .param p0, "minImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;
    .param p1, "maxImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;

    .prologue
    .line 75
    new-instance v0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    invoke-direct {v0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;-><init>()V

    .line 76
    .local v0, "options":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    sget v1, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxNumberOfImages(I)V

    .line 77
    invoke-virtual {v0, p0}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMinImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V

    .line 78
    invoke-virtual {v0, p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V

    .line 79
    return-object v0
.end method


# virtual methods
.method public getAllowedFileExtensions()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->allowedFileExtensions:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageValidatorType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->imageValidatorType:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxImageDimensions()Lcom/behance/sdk/BehanceSDKImageDimensions;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

    return-object v0
.end method

.method public getMaxImageSizeInBytes()J
    .registers 3

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxImageSizeInBytes:J

    return-wide v0
.end method

.method public getMaxNumberOfImages()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxNumberOfImages:I

    return v0
.end method

.method public getMinImageDimensions()Lcom/behance/sdk/BehanceSDKImageDimensions;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->minImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

    return-object v0
.end method

.method public getMinImageSizeInBytes()J
    .registers 3

    .prologue
    .line 118
    iget-wide v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->minImageSizeInBytes:J

    return-wide v0
.end method

.method public getProhibitedFileExtensions()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->prohibitedFileExtensions:Ljava/util/ArrayList;

    return-object v0
.end method

.method public hideImageSelectionSources()V
    .registers 2

    .prologue
    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->showImageSelectionSources:Z

    .line 115
    return-void
.end method

.method public isShowImageImageSelectionSources()Z
    .registers 2

    .prologue
    .line 110
    iget-boolean v0, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->showImageSelectionSources:Z

    return v0
.end method

.method public setAllowedFileExtensions(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "allowedFileExtensions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->allowedFileExtensions:Ljava/util/ArrayList;

    .line 139
    return-void
.end method

.method public setImageValidatorType(Ljava/lang/String;)V
    .registers 2
    .param p1, "imageValidatorType"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->imageValidatorType:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setMaxImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V
    .registers 2
    .param p1, "maxImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

    .line 107
    return-void
.end method

.method public setMaxImageSizeInBytes(J)V
    .registers 4
    .param p1, "maxImageSizeInBytes"    # J

    .prologue
    .line 130
    iput-wide p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxImageSizeInBytes:J

    .line 131
    return-void
.end method

.method public setMaxNumberOfImages(I)V
    .registers 2
    .param p1, "maxNumberOfImages"    # I

    .prologue
    .line 87
    if-nez p1, :cond_4

    .line 88
    sget p1, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    .line 90
    :cond_4
    iput p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->maxNumberOfImages:I

    .line 91
    return-void
.end method

.method public setMinImageDimensions(Lcom/behance/sdk/BehanceSDKImageDimensions;)V
    .registers 2
    .param p1, "minImageDimensions"    # Lcom/behance/sdk/BehanceSDKImageDimensions;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->minImageDimensions:Lcom/behance/sdk/BehanceSDKImageDimensions;

    .line 99
    return-void
.end method
