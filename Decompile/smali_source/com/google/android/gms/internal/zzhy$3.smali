.class Lcom/google/android/gms/internal/zzhy$3;
.super Lcom/google/android/gms/internal/zzab;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzhy;->zzb(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/internal/zzih;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzIi:Lcom/google/android/gms/internal/zzhy;

.field final synthetic zzIj:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhy;Ljava/lang/String;Lcom/google/android/gms/internal/zzm$zzb;Lcom/google/android/gms/internal/zzm$zza;Ljava/util/Map;)V
    .registers 6

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhy$3;->zzIi:Lcom/google/android/gms/internal/zzhy;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzhy$3;->zzIj:Ljava/util/Map;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/android/gms/internal/zzab;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzm$zzb;Lcom/google/android/gms/internal/zzm$zza;)V

    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zza;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy$3;->zzIj:Ljava/util/Map;

    if-nez v0, :cond_9

    invoke-super {p0}, Lcom/google/android/gms/internal/zzab;->getHeaders()Ljava/util/Map;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy$3;->zzIj:Ljava/util/Map;

    goto :goto_8
.end method
