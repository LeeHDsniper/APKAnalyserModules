.class final Lcom/google/android/gms/internal/zzkq$1;
.super Lcom/google/android/gms/internal/zzkq;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkq;->zzg(Ljava/lang/String;Z)Lcom/google/android/gms/internal/zzkq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzkq",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzkq;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected synthetic zzbX(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzkq$1;->zzbY(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected zzbY(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 5

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->zznO()Lcom/google/android/gms/internal/zzkq$zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkq$1;->zztP:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkq$1;->zztQ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzkq$zza;->zzb(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
