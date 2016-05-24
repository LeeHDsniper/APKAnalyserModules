.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
.super Ljava/lang/Object;
.source "AdobeListIndexPath.java"


# instance fields
.field private row:I

.field private section:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "section"    # I
    .param p2, "row"    # I

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;->section:I

    .line 27
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;->row:I

    .line 28
    return-void
.end method
