.class public final Lcom/google/android/gms/internal/zzqf$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzaTm:Z

.field private zzaTn:Z

.field private final zzaTo:Ljava/lang/String;

.field private zztw:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTm:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTn:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTo:Ljava/lang/String;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzqf$zza;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzqf$zza;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTm:Z

    return v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzqf$zza;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTn:Z

    return v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzqf$zza;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqf$zza;->zztw:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public zzBm()Lcom/google/android/gms/internal/zzqf;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zzqf;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzqf;-><init>(Lcom/google/android/gms/internal/zzqf$zza;Lcom/google/android/gms/internal/zzqf$1;)V

    return-object v0
.end method

.method public zzau(Z)Lcom/google/android/gms/internal/zzqf$zza;
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTm:Z

    return-object p0
.end method

.method public zzav(Z)Lcom/google/android/gms/internal/zzqf$zza;
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzqf$zza;->zzaTn:Z

    return-object p0
.end method

.method public zzfh(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqf$zza;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqf$zza;->zztw:Ljava/lang/String;

    return-object p0
.end method
