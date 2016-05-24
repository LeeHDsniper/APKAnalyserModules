.class public Lcom/google/android/gms/internal/zzgc;
.super Lcom/google/android/gms/internal/zzgb;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzCK:Ljava/lang/Object;

.field private zzCL:Landroid/widget/PopupWindow;

.field private zzCM:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzgb;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCK:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCM:Z

    return-void
.end method

.method private zzfq()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzCK:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCM:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_2a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    :cond_2d
    monitor-exit v1

    return-void

    :catchall_2f
    move-exception v0

    monitor-exit v1
    :try_end_31
    .catchall {:try_start_4 .. :try_end_31} :catchall_2f

    throw v0
.end method


# virtual methods
.method public onStop()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgc;->zzfq()V

    invoke-super {p0}, Lcom/google/android/gms/internal/zzgb;->onStop()V

    return-void
.end method

.method protected zzfp()V
    .registers 8

    const/4 v0, 0x0

    const/4 v3, -0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_76

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    move-object v1, v0

    :goto_11
    if-eqz v1, :cond_19

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1a

    :cond_19
    :goto_19
    return-void

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_19

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v0, v2, v3, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgc;->zzCK:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3f
    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzgc;->zzCM:Z

    if-eqz v3, :cond_48

    monitor-exit v2

    goto :goto_19

    :catchall_45
    move-exception v0

    monitor-exit v2
    :try_end_47
    .catchall {:try_start_3f .. :try_end_47} :catchall_45

    throw v0

    :cond_48
    :try_start_48
    new-instance v3, Landroid/widget/PopupWindow;

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct {v3, v0, v4, v5, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v3, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    const-string v0, "Displaying the 1x1 popup off the screen."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V
    :try_end_63
    .catchall {:try_start_48 .. :try_end_63} :catchall_45

    :try_start_63
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_6f} :catch_71
    .catchall {:try_start_63 .. :try_end_6f} :catchall_45

    :goto_6f
    :try_start_6f
    monitor-exit v2

    goto :goto_19

    :catch_71
    move-exception v0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzCL:Landroid/widget/PopupWindow;
    :try_end_75
    .catchall {:try_start_6f .. :try_end_75} :catchall_45

    goto :goto_6f

    :cond_76
    move-object v1, v0

    goto :goto_11
.end method

.method protected zzi(Lcom/google/android/gms/internal/zzhj;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgc;->zzfq()V

    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgb;->zzi(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method
