.class public final Lcom/google/android/gms/internal/zzgo;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzBm:Ljava/lang/String;

.field private zzEZ:Ljava/lang/String;

.field private zzFa:Lcom/google/android/gms/internal/zzie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzie",
            "<",
            "Lcom/google/android/gms/internal/zzgq;",
            ">;"
        }
    .end annotation
.end field

.field zzFb:Lcom/google/android/gms/internal/zzdv$zzd;

.field public final zzFc:Lcom/google/android/gms/internal/zzdg;

.field public final zzFd:Lcom/google/android/gms/internal/zzdg;

.field zzoL:Lcom/google/android/gms/internal/zzip;

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzpc:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/zzie;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzie;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFa:Lcom/google/android/gms/internal/zzie;

    new-instance v0, Lcom/google/android/gms/internal/zzgo$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzgo$1;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFc:Lcom/google/android/gms/internal/zzdg;

    new-instance v0, Lcom/google/android/gms/internal/zzgo$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzgo$2;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFd:Lcom/google/android/gms/internal/zzdg;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgo;->zzEZ:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgo;->zzBm:Ljava/lang/String;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzpc:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzie;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFa:Lcom/google/android/gms/internal/zzie;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzBm:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzEZ:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzdv$zzd;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgo;->zzFb:Lcom/google/android/gms/internal/zzdv$zzd;

    return-void
.end method

.method public zze(Lcom/google/android/gms/internal/zzip;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgo;->zzoL:Lcom/google/android/gms/internal/zzip;

    return-void
.end method

.method public zzfH()Lcom/google/android/gms/internal/zzdv$zzd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFb:Lcom/google/android/gms/internal/zzdv$zzd;

    return-object v0
.end method

.method public zzfI()Ljava/util/concurrent/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/google/android/gms/internal/zzgq;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzFa:Lcom/google/android/gms/internal/zzie;

    return-object v0
.end method

.method public zzfJ()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgo;->zzoL:Lcom/google/android/gms/internal/zzip;

    :cond_c
    return-void
.end method
