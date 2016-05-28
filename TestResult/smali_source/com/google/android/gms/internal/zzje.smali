.class public abstract Lcom/google/android/gms/internal/zzje;
.super Lcom/google/android/gms/internal/zzjd$zza;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzjd$zza;"
    }
.end annotation


# instance fields
.field protected zzPW:Lcom/google/android/gms/common/api/zzc$zzb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/zzc$zzb",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzc$zzb;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zzc$zzb",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzjd$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzje;->zzPW:Lcom/google/android/gms/common/api/zzc$zzb;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;)V
    .registers 2

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/Status;Landroid/os/ParcelFileDescriptor;)V
    .registers 3

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/Status;Z)V
    .registers 3

    return-void
.end method

.method public zzc(Lcom/google/android/gms/common/api/Status;)V
    .registers 2

    return-void
.end method
