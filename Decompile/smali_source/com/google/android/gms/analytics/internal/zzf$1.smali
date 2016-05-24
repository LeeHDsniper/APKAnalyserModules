.class Lcom/google/android/gms/analytics/internal/zzf$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/internal/zzf;->zzip()Ljava/lang/Thread$UncaughtExceptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzLQ:Lcom/google/android/gms/analytics/internal/zzf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzf$1;->zzLQ:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "error"    # Ljava/lang/Throwable;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf$1;->zzLQ:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzir()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    if-eqz v0, :cond_d

    const-string v1, "Job execution failed"

    invoke-virtual {v0, v1, p2}, Lcom/google/android/gms/analytics/internal/zzaf;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_d
    return-void
.end method
