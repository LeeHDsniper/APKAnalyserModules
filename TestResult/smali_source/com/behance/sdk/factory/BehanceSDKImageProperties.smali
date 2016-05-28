.class public Lcom/behance/sdk/factory/BehanceSDKImageProperties;
.super Ljava/lang/Object;
.source "BehanceSDKImageProperties.java"


# instance fields
.field private height:I

.field private name:Ljava/lang/String;

.field private size:J

.field private type:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getHeight()I
    .registers 2

    .prologue
    .line 31
    iget v0, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->height:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->size:J

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 23
    iget v0, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->width:I

    return v0
.end method

.method public setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->height:I

    .line 36
    return-void
.end method

.method public setSize(J)V
    .registers 4
    .param p1, "size"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->size:J

    .line 44
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->type:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->width:I

    .line 28
    return-void
.end method
