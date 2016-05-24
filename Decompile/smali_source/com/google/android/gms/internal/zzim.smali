.class Lcom/google/android/gms/internal/zzim;
.super Lcom/google/android/gms/internal/zzio;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private final zzIS:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .registers 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzio;-><init>(Landroid/view/View;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzim;->zzIS:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzim;->zzIS:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v0, :cond_e

    invoke-interface {v0}, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;->onGlobalLayout()V

    :goto_d
    return-void

    :cond_e
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzim;->detach()V

    goto :goto_d
.end method

.method protected zza(Landroid/view/ViewTreeObserver;)V
    .registers 2

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method protected zzb(Landroid/view/ViewTreeObserver;)V
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method
