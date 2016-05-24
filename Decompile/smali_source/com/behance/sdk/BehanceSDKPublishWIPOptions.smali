.class public Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
.super Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;
.source "BehanceSDKPublishWIPOptions.java"


# instance fields
.field private existingWIPId:I

.field private wipDescription:Ljava/lang/String;

.field private wipRevisionImageModule:Lcom/behance/sdk/project/modules/ImageModule;

.field private wipTags:Ljava/lang/String;

.field private wipTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "wipRevisionImageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;-><init>()V

    .line 51
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setWipRevisionImageModule(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "wipRevisionImageFile"    # Ljava/io/File;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;-><init>()V

    .line 43
    new-instance v0, Lcom/behance/sdk/project/modules/ImageModule;

    invoke-direct {v0, p1}, Lcom/behance/sdk/project/modules/ImageModule;-><init>(Ljava/io/File;)V

    .line 44
    .local v0, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-direct {p0, v0}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setWipRevisionImageModule(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 45
    return-void
.end method

.method private setWipRevisionImageModule(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "wipRevisionImageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipRevisionImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    .line 70
    return-void
.end method


# virtual methods
.method public getExistingWIPId()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->existingWIPId:I

    return v0
.end method

.method public getWipDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getWipRevisionImageModule()Lcom/behance/sdk/project/modules/ImageModule;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipRevisionImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    return-object v0
.end method

.method public getWipTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipTags:Ljava/lang/String;

    return-object v0
.end method

.method public getWipTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipTitle:Ljava/lang/String;

    return-object v0
.end method

.method public setExistingWIPId(I)V
    .registers 2
    .param p1, "existingWIPId"    # I

    .prologue
    .line 123
    iput p1, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->existingWIPId:I

    .line 124
    return-void
.end method

.method public setWipDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipDescription"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipDescription:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setWipTags(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTags"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipTags:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setWipTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTitle"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->wipTitle:Ljava/lang/String;

    .line 89
    return-void
.end method
