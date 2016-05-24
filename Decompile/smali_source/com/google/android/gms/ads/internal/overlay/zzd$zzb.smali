.class final Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;
.super Landroid/widget/RelativeLayout;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/internal/overlay/zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "zzb"
.end annotation


# instance fields
.field zzqF:Lcom/google/android/gms/internal/zzhw;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/google/android/gms/internal/zzhw;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzhw;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;->zzqF:Lcom/google/android/gms/internal/zzhw;

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;->zzqF:Lcom/google/android/gms/internal/zzhw;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzhw;->zze(Landroid/view/MotionEvent;)V

    const/4 v0, 0x0

    return v0
.end method
