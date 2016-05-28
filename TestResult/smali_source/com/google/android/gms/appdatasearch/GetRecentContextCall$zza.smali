.class public Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;
.super Lcom/google/android/gms/common/api/zzc$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/appdatasearch/GetRecentContextCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/zzc$zza",
        "<",
        "Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;",
        "Lcom/google/android/gms/internal/zzjf;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzPj:Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 4

    sget-object v0, Lcom/google/android/gms/appdatasearch/zza;->zzOO:Lcom/google/android/gms/common/api/Api$zzc;

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/api/zzc$zza;-><init>(Lcom/google/android/gms/common/api/Api$zzc;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    iput-object p1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;->zzPj:Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;

    return-void
.end method


# virtual methods
.method protected zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;
    .registers 3

    new-instance v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;-><init>()V

    iput-object p1, v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPv:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method protected bridge synthetic zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/zzjf;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;->zza(Lcom/google/android/gms/internal/zzjf;)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzjf;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzjf;->zzlg()Lcom/google/android/gms/internal/zzjc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;->zzPj:Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;

    new-instance v2, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza$1;

    invoke-direct {v2, p0, p0}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza$1;-><init>(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;Lcom/google/android/gms/common/api/zzc$zzb;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;Lcom/google/android/gms/internal/zzjd;)V

    return-void
.end method

.method protected synthetic zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$zza;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    move-result-object v0

    return-object v0
.end method
