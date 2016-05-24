.class Lcom/google/android/gms/internal/zzfz$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfz;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzCH:Lcom/google/android/gms/internal/zzfz;

.field final synthetic zzpx:Lcom/google/android/gms/internal/zzhj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/internal/zzhj;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfz$2;->zzCH:Lcom/google/android/gms/internal/zzfz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfz$2;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfz$2;->zzCH:Lcom/google/android/gms/internal/zzfz;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzfz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfz$2;->zzCH:Lcom/google/android/gms/internal/zzfz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfz$2;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzfz;->zzi(Lcom/google/android/gms/internal/zzhj;)V

    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_e

    throw v0
.end method
