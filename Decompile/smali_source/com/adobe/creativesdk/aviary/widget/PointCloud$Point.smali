.class Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
.super Ljava/lang/Object;
.source "PointCloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PointCloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Point"
.end annotation


# instance fields
.field radius:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>(FFF)V
    .registers 4
    .param p1, "x2"    # F
    .param p2, "y2"    # F
    .param p3, "r"    # F

    .prologue
    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->x:F

    .line 427
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->y:F

    .line 428
    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    .line 429
    return-void
.end method
