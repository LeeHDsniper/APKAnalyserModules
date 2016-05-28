.class public Lcom/google/android/gms/ads/internal/formats/zzj;
.super Lcom/google/android/gms/internal/zzcl$zza;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# instance fields
.field private final zznY:Landroid/widget/FrameLayout;

.field private final zzpc:Ljava/lang/Object;

.field private zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

.field private final zzwq:Landroid/widget/FrameLayout;

.field private final zzwr:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

.field zzwt:Z


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcl$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwr:Ljava/util/Map;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwt:Z

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zznY:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzil;->zza(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzil;->zza(Landroid/view/View;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/formats/zzj;)Landroid/widget/FrameLayout;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zznY:Landroid/widget/FrameLayout;

    return-object v0
.end method


# virtual methods
.method getMeasuredHeight()I
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method getMeasuredWidth()I
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-nez v0, :cond_9

    monitor-exit v1

    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/formats/zzb;->zzdq()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    const-string v2, "1007"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/formats/zzh;->performClick(Ljava/lang/String;)V

    :goto_20
    monitor-exit v1

    goto :goto_8

    :catchall_22
    move-exception v0

    monitor-exit v1
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_22

    throw v0

    :cond_25
    :try_start_25
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwr:Ljava/util/Map;

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzb(Landroid/view/View;Ljava/util/Map;)V
    :try_end_2c
    .catchall {:try_start_25 .. :try_end_2c} :catchall_22

    goto :goto_20
.end method

.method public onGlobalLayout()V
    .registers 6

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwt:Z

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/formats/zzj;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/formats/zzj;->getMeasuredHeight()I

    move-result v2

    if-eqz v0, :cond_20

    if-eqz v2, :cond_20

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zznY:Landroid/widget/FrameLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwt:Z

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzi(Landroid/view/View;)V

    :cond_2b
    monitor-exit v1

    return-void

    :catchall_2d
    move-exception v0

    monitor-exit v1
    :try_end_2f
    .catchall {:try_start_3 .. :try_end_2f} :catchall_2d

    throw v0
.end method

.method public onScrollChanged()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzi(Landroid/view/View;)V

    :cond_e
    monitor-exit v1

    return-void

    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-nez v0, :cond_a

    monitor-exit v1

    :goto_9
    return v4

    :cond_a
    invoke-virtual {p0, p2}, Lcom/google/android/gms/ads/internal/formats/zzj;->zzc(Landroid/view/MotionEvent;)Landroid/graphics/Point;

    move-result-object v0

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    iget v3, v0, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iget v0, v0, Landroid/graphics/Point;->y:I

    int-to-float v0, v0

    invoke-virtual {v2, v3, v0}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzb(Landroid/view/MotionEvent;)V

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    monitor-exit v1

    goto :goto_9

    :catchall_25
    move-exception v0

    monitor-exit v1
    :try_end_27
    .catchall {:try_start_4 .. :try_end_27} :catchall_25

    throw v0
.end method

.method public zzU(Ljava/lang/String;)Lcom/google/android/gms/dynamic/zzd;
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_14

    const/4 v0, 0x0

    :goto_e
    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    monitor-exit v1

    return-object v0

    :cond_14
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_e

    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/dynamic/zzd;)V
    .registers 7

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzp(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    if-nez v0, :cond_12

    :try_start_b
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_10
    monitor-exit v1

    return-void

    :cond_12
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwr:Ljava/util/Map;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_10

    :catchall_23
    move-exception v0

    monitor-exit v1
    :try_end_25
    .catchall {:try_start_b .. :try_end_25} :catchall_23

    throw v0
.end method

.method public zzb(Lcom/google/android/gms/dynamic/zzd;)V
    .registers 6

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwt:Z

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzp(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/formats/zzh;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    instance-of v1, v1, Lcom/google/android/gms/ads/internal/formats/zzg;

    if-eqz v1, :cond_4a

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    check-cast v1, Lcom/google/android/gms/ads/internal/formats/zzg;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/formats/zzg;->zzdx()Z

    move-result v1

    if-eqz v1, :cond_4a

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    check-cast v1, Lcom/google/android/gms/ads/internal/formats/zzg;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/internal/formats/zzg;->zzb(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    :cond_23
    :goto_23
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zznY:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzj;->zzf(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/ads/internal/formats/zzb;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

    if-eqz v1, :cond_39

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zznY:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzws:Lcom/google/android/gms/ads/internal/formats/zzb;

    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    :cond_39
    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/ads/internal/formats/zzj$1;

    invoke-direct {v3, p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzj$1;-><init>(Lcom/google/android/gms/ads/internal/formats/zzj;Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzh(Landroid/view/View;)V

    monitor-exit v2

    return-void

    :cond_4a
    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    instance-of v1, v1, Lcom/google/android/gms/ads/internal/formats/zzg;

    if-eqz v1, :cond_23

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    check-cast v1, Lcom/google/android/gms/ads/internal/formats/zzg;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/internal/formats/zzg;->zzb(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    goto :goto_23

    :catchall_5b
    move-exception v0

    monitor-exit v2
    :try_end_5d
    .catchall {:try_start_4 .. :try_end_5d} :catchall_5b

    throw v0
.end method

.method zzc(Landroid/view/MotionEvent;)Landroid/graphics/Point;
    .registers 6

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj;->zzwq:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    const/4 v2, 0x0

    aget v2, v0, v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    const/4 v3, 0x1

    aget v0, v0, v3

    int-to-float v0, v0

    sub-float v0, v2, v0

    new-instance v2, Landroid/graphics/Point;

    float-to-int v1, v1

    float-to-int v0, v0

    invoke-direct {v2, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    return-object v2
.end method

.method zzf(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/ads/internal/formats/zzb;
    .registers 3

    invoke-virtual {p1, p0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zza(Landroid/view/View$OnClickListener;)Lcom/google/android/gms/ads/internal/formats/zzb;

    move-result-object v0

    return-object v0
.end method
