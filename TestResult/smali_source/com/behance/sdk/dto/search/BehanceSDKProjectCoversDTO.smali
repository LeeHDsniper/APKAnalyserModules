.class public Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;
.super Ljava/lang/Object;
.source "BehanceSDKProjectCoversDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x67cbd2c66553f590L


# instance fields
.field private coverImages:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->coverImages:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public addCoverImages(ILjava/lang/String;)V
    .registers 5
    .param p1, "res"    # I
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 44
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_11

    .line 45
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->coverImages:Landroid/util/SparseArray;

    invoke-static {p2}, Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;->getNewInstance(Ljava/lang/String;)Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 47
    :cond_11
    return-void
.end method
