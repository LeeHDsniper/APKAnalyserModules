.class Lcom/google/android/gms/internal/zzdp$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdp;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxt:Lcom/google/android/gms/internal/zzdp;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdp;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdp$1;->zzxt:Lcom/google/android/gms/internal/zzdp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbK()Lcom/google/android/gms/internal/zzdq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdp$1;->zzxt:Lcom/google/android/gms/internal/zzdp;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzdq;->zzb(Lcom/google/android/gms/internal/zzdp;)V

    return-void
.end method
