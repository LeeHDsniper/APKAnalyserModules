.class public interface abstract Lcom/google/android/gms/common/api/zzj;
.super Ljava/lang/Object;


# virtual methods
.method public abstract begin()V
.end method

.method public abstract connect()V
.end method

.method public abstract disconnect()V
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract onConnected(Landroid/os/Bundle;)V
.end method

.method public abstract onConnectionSuspended(I)V
.end method

.method public abstract zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<TR;TA;>;>(TT;)TT;"
        }
    .end annotation
.end method

.method public abstract zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;I)V"
        }
    .end annotation
.end method
