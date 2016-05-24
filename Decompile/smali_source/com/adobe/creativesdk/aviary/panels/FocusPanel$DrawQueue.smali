.class Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
.super Ljava/util/concurrent/LinkedBlockingQueue;
.source "FocusPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/FocusPanel;
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

.field private tiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;)V
    .registers 3
    .param p1, "tiltShiftMode"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .prologue
    .line 276
    invoke-direct {p0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 277
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->tiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .line 278
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->completed:Z

    .line 279
    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    .prologue
    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->tiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    return-object v0
.end method


# virtual methods
.method public end()V
    .registers 2

    .prologue
    .line 286
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->completed:Z

    .line 287
    return-void
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 290
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->completed:Z

    return v0
.end method
