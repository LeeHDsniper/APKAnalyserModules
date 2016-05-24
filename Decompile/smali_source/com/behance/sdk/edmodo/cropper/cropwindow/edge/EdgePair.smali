.class public Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;
.super Ljava/lang/Object;
.source "EdgePair.java"


# instance fields
.field public primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field public secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V
    .registers 3
    .param p1, "edge1"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .param p2, "edge2"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 30
    iput-object p2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 31
    return-void
.end method
