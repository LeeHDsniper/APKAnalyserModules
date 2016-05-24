.class Lcom/google/android/gms/internal/zzdv$zze$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzij$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv$zze;->zzdM()Lcom/google/android/gms/internal/zzdv$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzya:Lcom/google/android/gms/internal/zzdv$zzd;

.field final synthetic zzyb:Lcom/google/android/gms/internal/zzdv$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv$zze;Lcom/google/android/gms/internal/zzdv$zzd;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$zze$2;->zzyb:Lcom/google/android/gms/internal/zzdv$zze;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$zze$2;->zzya:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    const-string v0, "Rejecting reference for JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$zze$2;->zzya:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zzd;->reject()V

    return-void
.end method
