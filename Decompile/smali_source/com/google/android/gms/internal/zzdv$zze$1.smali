.class Lcom/google/android/gms/internal/zzdv$zze$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzij$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv$zze;->zzdM()Lcom/google/android/gms/internal/zzdv$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzij$zzc",
        "<",
        "Lcom/google/android/gms/internal/zzbb;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzya:Lcom/google/android/gms/internal/zzdv$zzd;

.field final synthetic zzyb:Lcom/google/android/gms/internal/zzdv$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv$zze;Lcom/google/android/gms/internal/zzdv$zzd;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$zze$1;->zzyb:Lcom/google/android/gms/internal/zzdv$zze;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$zze$1;->zzya:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzbb;)V
    .registers 4

    const-string v0, "Getting a new session for JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$zze$1;->zzya:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzbb;->zzci()Lcom/google/android/gms/internal/zzbf;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzdv$zzd;->zzg(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic zzc(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzbb;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzdv$zze$1;->zza(Lcom/google/android/gms/internal/zzbb;)V

    return-void
.end method
