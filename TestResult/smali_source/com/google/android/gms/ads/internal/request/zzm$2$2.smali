.class Lcom/google/android/gms/ads/internal/request/zzm$2$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzij$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/request/zzm$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzEE:Lcom/google/android/gms/ads/internal/request/zzm$2;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/request/zzm$2;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/zzm$2$2;->zzEE:Lcom/google/android/gms/ads/internal/request/zzm$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/request/zzm;->zzfD()Lcom/google/android/gms/internal/zzdl;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzm$2$2;->zzEE:Lcom/google/android/gms/ads/internal/request/zzm$2;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/request/zzm$2;->zzED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzdl;->zzX(Ljava/lang/String;)V

    return-void
.end method
