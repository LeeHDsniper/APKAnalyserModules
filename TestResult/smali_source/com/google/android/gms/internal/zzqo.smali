.class public Lcom/google/android/gms/internal/zzqo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Result;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqo$zza;
    }
.end annotation


# instance fields
.field private final zzaTI:Lcom/google/android/gms/internal/zzqo$zza;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzqo$zza;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqo;->zzaTI:Lcom/google/android/gms/internal/zzqo$zza;

    return-void
.end method


# virtual methods
.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo;->zzaTI:Lcom/google/android/gms/internal/zzqo$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqo$zza;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    return-object v0
.end method

.method public zzBw()Lcom/google/android/gms/internal/zzqo$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo;->zzaTI:Lcom/google/android/gms/internal/zzqo$zza;

    return-object v0
.end method
