.class public Lcom/google/android/gms/internal/zzig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzig$zza;
    }
.end annotation


# direct methods
.method public static zza(Lcom/google/android/gms/internal/zzih;Lcom/google/android/gms/internal/zzig$zza;)Lcom/google/android/gms/internal/zzih;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzih",
            "<TA;>;",
            "Lcom/google/android/gms/internal/zzig$zza",
            "<TA;TB;>;)",
            "Lcom/google/android/gms/internal/zzih",
            "<TB;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzie;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzie;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzig$1;

    invoke-direct {v1, v0, p1, p0}, Lcom/google/android/gms/internal/zzig$1;-><init>(Lcom/google/android/gms/internal/zzie;Lcom/google/android/gms/internal/zzig$zza;Lcom/google/android/gms/internal/zzih;)V

    invoke-interface {p0, v1}, Lcom/google/android/gms/internal/zzih;->zzc(Ljava/lang/Runnable;)V

    return-object v0
.end method
