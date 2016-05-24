.class final Lcom/google/android/gms/internal/zzkq$5;
.super Lcom/google/android/gms/internal/zzkq;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkq;->zzu(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/zzkq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzkq",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzkq;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected synthetic zzbX(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzkq$5;->zzcc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected zzcc(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->zznO()Lcom/google/android/gms/internal/zzkq$zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkq$5;->zztP:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkq$5;->zztQ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzkq$zza;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
