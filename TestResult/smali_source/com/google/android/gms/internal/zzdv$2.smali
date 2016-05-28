.class Lcom/google/android/gms/internal/zzdv$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzij$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv;->zzdK()Lcom/google/android/gms/internal/zzdv$zze;
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
.field final synthetic zzxL:Lcom/google/android/gms/internal/zzdv;

.field final synthetic zzxS:Lcom/google/android/gms/internal/zzdv$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzdv$zze;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxS:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzbb;)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzc(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzg(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdv$zze;

    move-result-object v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxS:Lcom/google/android/gms/internal/zzdv$zze;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzdv;->zzg(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdv$zze;

    move-result-object v2

    if-eq v0, v2, :cond_2d

    const-string v0, "New JS engine is loaded, marking previous one as destroyable."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzg(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdv$zze;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zze;->zzdO()V

    :cond_2d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$2;->zzxS:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzdv$zze;)Lcom/google/android/gms/internal/zzdv$zze;

    monitor-exit v1

    return-void

    :catchall_36
    move-exception v0

    monitor-exit v1
    :try_end_38
    .catchall {:try_start_7 .. :try_end_38} :catchall_36

    throw v0
.end method

.method public synthetic zzc(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzbb;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzdv$2;->zza(Lcom/google/android/gms/internal/zzbb;)V

    return-void
.end method
