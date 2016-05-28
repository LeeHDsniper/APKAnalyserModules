.class final Lcom/google/android/gms/internal/zzig$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzig;->zza(Lcom/google/android/gms/internal/zzih;Lcom/google/android/gms/internal/zzig$zza;)Lcom/google/android/gms/internal/zzih;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic zzIG:Lcom/google/android/gms/internal/zzie;

.field final synthetic zzIH:Lcom/google/android/gms/internal/zzig$zza;

.field final synthetic zzII:Lcom/google/android/gms/internal/zzih;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzie;Lcom/google/android/gms/internal/zzig$zza;Lcom/google/android/gms/internal/zzih;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzig$1;->zzIG:Lcom/google/android/gms/internal/zzie;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzig$1;->zzIH:Lcom/google/android/gms/internal/zzig$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzig$1;->zzII:Lcom/google/android/gms/internal/zzih;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzig$1;->zzIG:Lcom/google/android/gms/internal/zzie;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzig$1;->zzIH:Lcom/google/android/gms/internal/zzig$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzig$1;->zzII:Lcom/google/android/gms/internal/zzih;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzih;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzig$zza;->zze(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_11} :catch_1c
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_11} :catch_1a
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_11} :catch_12

    :goto_11
    return-void

    :catch_12
    move-exception v0

    :goto_13
    iget-object v0, p0, Lcom/google/android/gms/internal/zzig$1;->zzIG:Lcom/google/android/gms/internal/zzie;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->cancel(Z)Z

    goto :goto_11

    :catch_1a
    move-exception v0

    goto :goto_13

    :catch_1c
    move-exception v0

    goto :goto_13
.end method
