.class Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
.super Ljava/util/concurrent/LinkedBlockingQueue;
.source "BackgroundDrawThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DrawQueue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/LinkedBlockingQueue",
        "<[F>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private volatile completed:Z

.field private mode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

.field private radius:F

.field private startPoint:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;F[F)V
    .registers 7
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .param p2, "radius"    # F
    .param p3, "points"    # [F

    .prologue
    const/4 v2, 0x0

    .line 47
    invoke-direct {p0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->mode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 49
    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->radius:F

    .line 50
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->completed:Z

    .line 51
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->startPoint:Landroid/graphics/PointF;

    .line 53
    if-eqz p3, :cond_24

    array-length v0, p3

    const/4 v1, 0x2

    if-lt v0, v1, :cond_24

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->startPoint:Landroid/graphics/PointF;

    aget v1, p3, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->startPoint:Landroid/graphics/PointF;

    const/4 v1, 0x1

    aget v1, p3, v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 57
    :cond_24
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->add(Ljava/lang/Object;)Z

    .line 58
    return-void
.end method


# virtual methods
.method public end()V
    .registers 2

    .prologue
    .line 73
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->completed:Z

    .line 74
    return-void
.end method

.method public getMode()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->mode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    return-object v0
.end method

.method public getOriginalPoint()Landroid/graphics/PointF;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->startPoint:Landroid/graphics/PointF;

    return-object v0
.end method

.method public getRadius()F
    .registers 2

    .prologue
    .line 69
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->radius:F

    return v0
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->completed:Z

    return v0
.end method
