.class public Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
.super Ljava/lang/Object;
.source "BehanceSDKPublishedWIPRevisionDTO.java"


# instance fields
.field private revisionDescription:Ljava/lang/String;

.field private revisionId:I

.field private revisionURL:Ljava/lang/String;

.field private wipId:I

.field private wipImageURL:Ljava/lang/String;

.field private wipTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRevisionDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getRevisionId()I
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionId:I

    return v0
.end method

.method public getRevisionURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionURL:Ljava/lang/String;

    return-object v0
.end method

.method public getWipId()I
    .registers 2

    .prologue
    .line 44
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipId:I

    return v0
.end method

.method public getWipImageURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipImageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getWipTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipTitle:Ljava/lang/String;

    return-object v0
.end method

.method public setRevisionDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "revisionDescription"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionDescription:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setRevisionId(I)V
    .registers 2
    .param p1, "revisionId"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionId:I

    .line 41
    return-void
.end method

.method public setRevisionURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "revisionURL"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->revisionURL:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setWipId(I)V
    .registers 2
    .param p1, "wipId"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipId:I

    .line 49
    return-void
.end method

.method public setWipImageURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipImageURL"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipImageURL:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setWipTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTitle"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->wipTitle:Ljava/lang/String;

    .line 73
    return-void
.end method
