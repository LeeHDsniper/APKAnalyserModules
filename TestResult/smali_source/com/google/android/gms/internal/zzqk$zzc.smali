.class Lcom/google/android/gms/internal/zzqk$zzc;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mData:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private zzQA:Lcom/google/android/gms/common/api/Status;

.field private zzaTF:J


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Status;",
            "TT;J)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk$zzc;->zzQA:Lcom/google/android/gms/common/api/Status;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqk$zzc;->mData:Ljava/lang/Object;

    iput-wide p3, p0, Lcom/google/android/gms/internal/zzqk$zzc;->zzaTF:J

    return-void
.end method


# virtual methods
.method public zzBu()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzqk$zzc;->zzaTF:J

    return-wide v0
.end method

.method public zzQ(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk$zzc;->mData:Ljava/lang/Object;

    return-void
.end method

.method public zzU(J)V
    .registers 4

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzqk$zzc;->zzaTF:J

    return-void
.end method

.method public zzbh(Lcom/google/android/gms/common/api/Status;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk$zzc;->zzQA:Lcom/google/android/gms/common/api/Status;

    return-void
.end method
