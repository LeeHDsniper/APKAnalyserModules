.class public final Lcom/google/android/gms/internal/zzjh;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/appdatasearch/zzk;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;

    invoke-direct {v0, p2, p1}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;-><init>(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;

    move-result-object v0

    return-object v0
.end method
