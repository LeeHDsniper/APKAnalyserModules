.class public Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;
.super Ljava/lang/Object;
.source "PointCloud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PointCloud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WaveManager"
.end annotation


# instance fields
.field private alpha:F

.field private radius:F

.field private type:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

.field private width:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 387
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    const/high16 v0, 0x42480000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->radius:F

    .line 390
    const/high16 v0, 0x43480000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F

    .line 391
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F

    .line 392
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Circle:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->type:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    .prologue
    .line 387
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->radius:F

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    .prologue
    .line 387
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    .prologue
    .line 387
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F

    return v0
.end method


# virtual methods
.method public getAlpha()F
    .registers 2

    .prologue
    .line 411
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F

    return v0
.end method

.method public getRadius()F
    .registers 2

    .prologue
    .line 403
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->radius:F

    return v0
.end method

.method public getType()Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;
    .registers 2

    .prologue
    .line 395
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->type:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    return-object v0
.end method

.method public setAlpha(F)V
    .registers 2
    .param p1, "a"    # F

    .prologue
    .line 415
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F

    .line 416
    return-void
.end method

.method public setRadius(F)V
    .registers 2
    .param p1, "r"    # F

    .prologue
    .line 407
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->radius:F

    .line 408
    return-void
.end method

.method public setType(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;)V
    .registers 2
    .param p1, "t"    # Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->type:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    .line 400
    return-void
.end method
